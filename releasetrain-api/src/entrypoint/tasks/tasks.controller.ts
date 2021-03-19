import { Controller } from '@nestjs/common';
import { Crud } from '@nestjsx/crud';
import { Task } from 'src/domain/tasks/task.entity';
import { AbstractController } from '../core/abstract.controller';
@Crud({
    model: {
        type: Task,
    },
})
@Controller('tasks')
export class TasksController extends AbstractController<Task> {}
