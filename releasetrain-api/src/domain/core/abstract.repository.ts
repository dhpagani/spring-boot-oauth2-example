import AbstractEntity from 'src/domain/core/abstract.entity';
import { AbstractRepository } from 'typeorm';

export default abstract class AbstractRepositoryRT<
    T extends AbstractEntity
> extends AbstractRepository<T> {}
