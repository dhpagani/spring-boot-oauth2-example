import { Injectable } from '@nestjs/common';
import { AbstractService } from '../core/abstract.service';
import { Task } from './task.entity';
import { TasksRepository } from './tasks.repository';

@Injectable()
export class TasksService extends AbstractService<Task> {
    constructor(repo: TasksRepository) {
        super(repo);
    }
}
